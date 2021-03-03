/* ============================== MAIN ============================== */
function ShowLoading() {
    $('#loading-screen').css('display', 'flex');

    $('html, body').css({
        'height': '100%',
        'overflow': 'hidden',
    });
}

function HideLoading() {
    $('#loading-screen').hide();

    $('html, body').css({
        'height': 'auto',
    });

    $('html').css('overflow', 'auto');
}

function SetTabActive(index) {
    $('.main-menu li').eq(index).addClass('active');
}

$(function () {
    $('#page-content').css('min-height', $(window).height() - 51);
    
    $(document).click(function (event) {
        var _opened = $('#user-info-box').hasClass('open');
        var clickover = $(event.target);

        if (clickover.attr('id') == 'user-detail') return;
        if (clickover.attr('id') == 'user-info-box') return;
        if (clickover.closest('div').attr('id') == 'user-info-box') return;

        if (_opened === true) {
            $('#user-info-box').click();
        }
    });
});
/* ============================== MAIN ============================== */

/* ============================== SIDEBAR ============================== */
$(function () {
    $('.dropdown-li').click(function () {
        $(this).find('.dropdown-arrow').toggleClass('active');
        $(this).find('.sub-menu').slideToggle();
    });
});
/* ============================== SIDEBAR ============================== */

/* ============================== NAVBAR ============================== */
$(function () {
    $('#user-info-box').click(function (e) {
        $(this).toggleClass('open');
        $('#user-detail').fadeToggle();
    });
});
/* ============================== NAVBAR ============================== */

/* ============================== LOGIN PAGE ============================== */
$(function () {
    $('#login-container').css('height', $(window).height());
});

function ShowFPForm() {
    $('#login-form').fadeOut();
    $('#forgot-password-form').fadeIn();
}
/* ============================== LOGIN PAGE ============================== */