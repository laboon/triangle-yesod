module Handler.Home where

import Import

getHomeR :: Handler Html

getHomeR = defaultLayout $ do

    setTitle "Triangular Number"

    addScriptRemote "//ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"
    addStylesheetRemote "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"

    -- Hamlet is the standard HTML templating language used by Yesod.
    -- http://www.yesodweb.com/book/shakespearean-templates
    [whamlet|
        <div .container-fluid>
          <div .row-fluid>
            <h1>Triangle Numbers!!!

          <div .row-fluid>
            <div .span6>
                <h2>Triangular Numbers
                <p>
                    Triangular number
                    <input #triinput type=number value=4>
                    is
                    <span #trioutput>

    |]

    -- Similar to Hamlet, Yesod has Lucius for CSS, and Julius for Javascript.
    toWidget [lucius|
        body {
            margin: 0 auto;
        }

        #trioutput {
            font-size: x-large;
            color: #F00;

        }
    |]
    toWidget [julius|
        function updateTri() {
            $.getJSON("/tri/" + $("#triinput").val(),
                function (o) {
                    $("#trioutput").text(o.triangular);
                }
            );
        }

        $(function(){
            updateTri();
            $("#triinput").change(updateTri);
        });
    |]