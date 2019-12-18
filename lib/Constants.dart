import 'package:flutter/material.dart';

const Color PRIMARY_COLOR = const Color.fromRGBO(0, 206, 201, 1);
const String APP_NAME = "Friendly Locations";



const String EMAIL_VERIFICATION_MESSAGE = "Es necesaria la verificación de su correo electrónico, para ello revise su bandeja de entrada";


const String HINT_USERNAME = "Nombre de usuario";
const String HINT_EMAIL = "Correo electrónico";
const String HINT_PASSWORD = "Contraseña";
const String HINT_CONFIRM_PASSWORD = "Confirmar contraseña";


const String ERROR_EMPTY_CORREO = "Ingrese correo electrónico";
const String ERROR_VALID_CORREO = "Ingrese un correo electrónico válido";

const String REGEX_EMAIL = r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';