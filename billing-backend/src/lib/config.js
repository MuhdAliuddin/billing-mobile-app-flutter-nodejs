const path = require('path');

// Static assets full path
module.exports.fontsPath = path.join(__dirname, '/src/fonts');
module.exports.savePath = path.join(__dirname, '..', '..', '/files/daily_report');
module.exports.bannerPath = path.join(__dirname, '..', '..', '/config/report/assets');

module.exports.emailHtml = `
<div dir="ltr">
    <div class="gmail_default" style="font-family:georgia,serif">
        Assalamu&#39;alaikum and greetings!
    </div>
    <div class="gmail_defaul=t" style="font-family:georgia,serif">
        <br>
    </div>
    <div class="gmail_defaul=t" style="font-family:georgia,serif">
        To whom it may concern, attached is the daily summary report of the guard touring activities as required by your company.
        Thank you.
    </div>
    <div class="gmail_default" style="font-family:georgia,serif">
        <br>
    </div>
    <div class="gmail_default" style="font-family:georgia,serif">
        Regards.
    </div>
    <div class="gmail_default" style="font-family:georgia,serif">
        <i>
            <font size="1">
                *This is a computer generated message, no signature is required.
            </font>
        </i>
    </div>
</div>
`;