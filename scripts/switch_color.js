function getCookie(name) {
    let matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}

function switch_color(color) {
    var body = document.getElementsByTagName("BODY")[0];
    var a = document.getElementsByTagName("A");
    var colored = document.getElementsByClassName("colored");
    var map = document.getElementsByClassName("ymaps-2-1-75-inner-panes")[0];
    switch (color) {
        case 'white':
            document.cookie = "color=white";
            document.getElementById("sidebar_logo_img").src = "./img/logo.png";
            document.getElementById("footer_logo_img").src = "./img/logo.png";
            body.style.cssText = "color: black; background: url(./img/christmas-white.png)";
            for (let item of colored) {
                item.style.backgroundColor = 'rgba(255, 255, 255, 0.8)';
            }

            for (let item of a) {
                item.style.color = 'black';
            }

            for (let item of colored) {
                item.style.boxShadow = "inset 0 0 30px rgba(0,0,0,0.5)";
            }
            if (map) {
                map.style.boxShadow = "0 0 30px rgba(0,0,0,0.5)";
                map.style.border = "1px solid #00ADFF";
            } 

            break;
        case 'black':
            document.cookie = "color=black";
            document.getElementById("sidebar_logo_img").src = "./img/logo_light.png";
            document.getElementById("footer_logo_img").src = "./img/logo_light.png";
            for (let item of colored) {
                item.style.backgroundColor = 'rgba(0,0,0,0.8)';
            }
            for (let item of a) {
                item.style.color = 'white';
            }

            for (let item of colored) {
                item.style.boxShadow = "inset 0 0 30px rgba(255,255,255,0.5)";
            }
            body.style.cssText = "color: white; background: url(./img/christmas-dark.png)";
            if (map) {
                map.style.boxShadow = "0 0 30px rgba(255,255,255,0.5)";
                map.style.border = "1px solid #00ADFF";
            }

            break;
    }
}

if (getCookie('color') == 'white') {
    document.getElementById('sidebar_logo').innerHTML = '<img id="sidebar_logo_img" src="./img/logo.png"  alt="">';
    document.getElementById('footer_logo').innerHTML = '<img id="footer_logo_img" src="./img/logo.png"  alt="">';
    switch_color('white');
} else if (getCookie('color') == 'black') {
    document.getElementById('sidebar_logo').innerHTML = '<img id="sidebar_logo_img" src="./img/logo_light.png"  alt="">';
    document.getElementById('footer_logo').innerHTML = '<img id="footer_logo_img" src="./img/logo_light.png"  alt="">';
    switch_color('black');
}