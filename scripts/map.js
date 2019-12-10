ymaps.ready(init);
var myMap, myPlacemark;

function init() {
    myMap = new ymaps.Map("map", {
        center: [47.03, 28.83],
        zoom: 13
    });

    myPlacemark = new ymaps.Placemark([47.03, 28.83], {
            hintContent: 'ArtStage!',
            balloonContent: 'Str. Metroposit Bodoni 32'
        }, {
            //Опции
            iconLayout: 'default#image',
            // Своё изображение иконки метки.
            iconImageHref: 'img/snowflake.png',
            // Размеры метки.
            iconImageSize: [48, 48],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-24, -24]

        }

    );

    myMap.geoObjects.add(myPlacemark);
}