import 'package:flutter/material.dart';
import '../../bloc/register/register_bloc.dart';

part 'mixin/register_mixin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterMixin {
  @override
  Widget build(BuildContext context) => const Scaffold();
}