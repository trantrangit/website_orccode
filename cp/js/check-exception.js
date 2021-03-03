// =========================================================
// Check Special Cases

function IsValidEmail(email) {
    var ree = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (!ree.test(email)) return true;
    return false;
}

// ==========================================================
// Check String

// null or empty
function IsString(string) {
    if (string == null || string.length == 0) return false;
    return true;
}

function IsString(string, minLength, maxLength) {
    if (string == null || string.length == 0) return false;
    if (string.length < minLength) return false;
    if (string.length > maxLength) return false;
    return true;
}

// same
function IsStringSame(stringA, stringB) {
    if (stringA !== stringB) return false;
    else return true;
}

// contain subString
function IsStringContain(string, subString) {
    if (string.indexOf(subString) === -1) return false;
    else return true;
}

// ==========================================================
// Check Number

function IsNumber(number) {
    if (number !== parseFloat(number, 10)) return false;
    else return true;
}

function IsNumber(number, min, max) {
    if (number !== parseFloat(number, 10)) return false;
    if (number < parseFloat(min, 10)) return false;
    if (number > parseFloat(max, 10)) return false;
    else return true;
}

function IsNumberInteger(number) {
    if (number !== parseInt(number, 10)) return false;
    else return true;
}

// ==========================================================
// Check Datetime

// =========================================================
// Jin's methods

function CheckFieldEmpty(selector) {
    $(selector).find('input').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).val() == null || $(this).val().length == 0) {
                $(this).addClass('error');
            }
        }
    });

    $(selector).find('textarea').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).hasClass('tinymce')) {
                var fieldValue = tinymce.get($(this).attr('id')).getContent();
                if (fieldValue == null || fieldValue.length == 0) {
                    $('.mce-tinymce .mce-container .mce-panel').addClass('error');
                }
            } else {
                if ($(this).hasClass('required')) {
                    if ($(this).val() == null || $(this).val().length == 0) {
                        $(this).addClass('error');
                    }
                }
            }
        }
    });

    $(selector).find('select').each(function () {
        if ($(this).hasClass('required')) {
            if ($(this).val() == 0) {
                $(this).addClass('error');
            }
        }
        
    });
}

function CheckFieldError() {
    var errorFlag = 0;
    $('input').each(function () {
        if ($(this).hasClass('error')) errorFlag = 1;
    });

    $('textarea').each(function () {
        if ($(this).hasClass('error')) errorFlag = 1;
    });

    $('select').each(function () {
        if ($(this).hasClass('error')) errorFlag = 1;
    });

    if (errorFlag == 1) return "Please fill in required field(*).<br>";
    return "";
}

function CheckPasswordMatch(password, rePassword) {
    if (password != rePassword) return "Password doesn't match. <br>";
    return "";
}

function IsPasswordValid(password) {
    if (password.length < 6) return "Your password must contain at least 6 characters.<br>";

    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    if (!format.test(password)) return "Your password must contain at least 1 special character.<br>";

    var i = 0;
    var character = '';
    var uppercase = false;
    while (i < password.length) {
        character = password.charAt(i);
        i++;
        if ($.isNumeric(character) == false) {
            if (character == character.toUpperCase()) {
                uppercase = true;
                break;
            }
        }
    }
    
    if (!uppercase) return "Your password must contain at least 1 uppercase charater.<br>";

    return "";
}

function CheckEmailValid(email) {
    var result = IsValidEmail(email);

    if (result) return "Your email is invalid! <br>";
    return "";
}