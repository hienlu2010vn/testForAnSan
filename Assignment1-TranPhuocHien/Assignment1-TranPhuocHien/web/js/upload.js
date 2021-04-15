var feedback = function(res) {
    if (res.success === true) {
        document.getElementById('showPic').style.display = "none";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status').classList.add('bg-success');
        document.querySelector('.status').innerHTML = '<input type="hidden" class="image-url" name="img" value=\"' + get_link + '\"/>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
    }
};

new Imgur({
    clientid: '5aaf8926a397fba', //You can change this ClientID
    callback: feedback
});