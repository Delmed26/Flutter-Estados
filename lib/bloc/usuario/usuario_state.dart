part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final userExists = false;

  // @override
  // String toString() {
  //   return 'UsuarioInicial: userExists = false';
  // }
}


class UsuarioActivo extends UsuarioState {
  final userExists = true;

  final Usuario usuario;

  UsuarioActivo(this.usuario);


}
