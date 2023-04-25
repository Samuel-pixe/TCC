import 'package:flutter/material.dart';

campoTexto(texto, controller, icone, {senha}) {
  return TextField(
    
    controller: controller,
    obscureText: senha != null ? true : false,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
    decoration: InputDecoration(
      
      prefixIcon: Icon(icone, color: Colors.grey.shade900),
      prefixIconColor: Colors.grey.shade900,
      labelText: texto,
      labelStyle: const TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusColor: Colors.grey.shade900,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 0.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      
    ),
    
  );
}
