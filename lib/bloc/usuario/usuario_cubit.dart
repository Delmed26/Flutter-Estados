import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void selectUser (Usuario user) {
    emit(UsuarioActivo(user));
  }

  void changeEdad (int edad) {

    final currentState = state;
    if (currentState is UsuarioActivo) {
      final user = currentState.usuario.copyWith(edad: 30);
      emit(UsuarioActivo(user));
    }

  }


  void addProfession (String profession) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final user = currentState.usuario.copyWith();
      user.profesiones.add("iOS Developer");
      emit(UsuarioActivo(user));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
