$(document).ready(function () {
    $('form').bootstrapValidator({
//        excluded: [':disabled'],
        message: 'This value is not valid',
        live: 'enabled',
        excluded: [':disabled'],
        feedbackIcons: {
//            valid: 'glyphicon glyphicon-ok',
//            invalid: 'glyphicon glyphicon-remove',
//            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: 'Name is not valid',
                validators: {
                    notEmpty: {
                        message: 'Name is mandetory'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z ]+$/,
                        message: 'Name can only consist of alphabets'
                    }
                }
            },
            regno: {
                message: 'The mobile no is not valid',
                validators: {
                    notEmpty: {
                        message: 'The registration no is mandatory'
                    },
                    stringLength: {
                        min: 10,
                        max: 10,
                        message: 'registration no should be 10 digit'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Registration no should contains digits from 0-9'
                    }
                }
            },
            mobile: {
                message: 'The mobile no is not valid',
                validators: {
                    notEmpty: {
                        message: 'The mobile no is mandatory'
                    },
                    stringLength: {
                        min: 10,
                        max: 10,
                        message: 'mobile no should be 10 digit'
                    },
                    regexp: {
                        regexp: /^[6|7|8|9][0-9]+$/,
                        message: 'Mobile no should be started from 6/7/8/9'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email id is mandatory'
                    },
//                        emailAddress: {
//                            message: 'The input is not a valid email address'
//                        }
                    regexp: {
                        regexp: /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/,
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'Password is mandatory'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'Confirm password is mandatory'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            address: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    }
                }
            },
            city: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    }
                }
            },
            booktitle: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    }
                }
            },
            author: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    }
                }
            },
            publications: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    }
                }
            },
            noofpages: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Only digits from 0-9'
                    }
                }
            },
            price: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Only digits from 0-9'
                    }
                }
            },
            qty: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Only digits from 0-9'
                    }
                }
            },
            sid: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Only digits from 0-9'
                    }
                }
            },
            bookid: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Only digits from 0-9'
                    }
                }
            },
            dateofissue: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    }
                }
            },
            userid: {
                validators: {
                    notEmpty: {
                        message: 'This field is mandatory'
                    }
                }
            },
            sname: {
                message: 'Name is not valid',
                validators: {
                    notEmpty: {
                        message: 'Name is mandetory'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z ]+$/,
                        message: 'Name can only consist of alphabets'
                    }
                }
            }
        }
    });

    $('#ForgotPasswordForm').submit(function () {
        $('.msg').hide();
        var formElement = $(this);
        $(this).find('button[type=submit]').html("Wait...<i class='fa fa-refresh fa-spin fa-fw'></i>");

        var email = $(this).find('input[name=email]').val();
        var role = $(this).find('select[name=role]').val();

        $.ajax({
            type: 'POST',
            url: "ForgotPassword1.jsp",
            data: "email=" + email + "&role=" + role,
            success: function (response) {
                $('.msg').text(response).show();
                $(formElement).find('button[type=submit]').html("Submit");
                $(formElement).find('button[type=submit]').removeAttr('disabled');
            },
            error: function (error) {
                $('.msg').text("Unable to process your request").show();
            }
        });
    });
});