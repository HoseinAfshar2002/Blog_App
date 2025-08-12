import 'package:blog_app/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';


import 'colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 50,
      color: Colors.black,
      indent: 40,
      endIndent: 40,
      thickness: 1.5,
    );
  }
}


class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({
    super.key, required this.hintText,
  });

  final String hintText ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value + " is Email : " + isEmail(value).toString());
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(
            255,
            219,
            219,
            219,
          ),
        ),
      ),
    );
  }
}


class PassInputWidget extends StatelessWidget {
  const PassInputWidget({
    super.key, required this.hintText,
  });

  final String hintText ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value + " is Email : " + isEmail(value).toString());
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Color.fromARGB(
            255,
            219,
            219,
            219,
          ),
        ),
      ),
    );
  }
}


class NameInputWidget extends StatelessWidget {
  const NameInputWidget({
    super.key, required this.hintText,
  });

  final String hintText ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
       width: double.infinity,
        child: TextField(
          onChanged: (value) {
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(
                255,
                219,
                219,
                219,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


