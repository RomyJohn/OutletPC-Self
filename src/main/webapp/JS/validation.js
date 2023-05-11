const success = (msg) => {
    Snackbar.show({
        text: '<i class="fas fa-check-circle mr-2 text-success"></i> ' + msg,
        showAction: false,
        pos: 'bottom-center',
        duration: 1500,
        onClose: function () {
            location.reload();
        }
    });
};

const warning = (msg) => {
    Snackbar.show({
        text: '<i class="fas fa-exclamation mr-2 text-warning"></i> ' + msg,
        showAction: false,
        pos: 'bottom-center'});
};

const error = () => {
    Snackbar.show({
        text: '<i class="fas fa-exclamation-triangle mr-2 text-danger"></i> Server is not responding',
        showAction: false,
        pos: 'bottom-center'});
};

const isEmpty = (element, error, msg) => {
    if ($(element).val() === "" || $(element).length === 0)
    {
        $(element).addClass("is-invalid");
        $(error).html(msg);
        return false;
    }
    return true;
};

const expression = (regex, element, error, msg) => {
    if (regex.test($(element).val())) {
        $(element).removeClass("is-invalid");
        $(error).html("");
        return true;
    } else {
        $(element).addClass("is-invalid");
        $(error).html(msg);
        return false;
    }
};

const removeMsg = (element, error) => {
    $(element).on("keydown keypress", function () {
        $(this).removeClass("is-invalid");
        $(error).html("");
    });
};

const showAlert = (remove, add, msg) => {
    $(".alert").removeClass(remove).addClass(add).html(msg).show();
    $(".spinner-border").hide();
    $(".card").show();
};
