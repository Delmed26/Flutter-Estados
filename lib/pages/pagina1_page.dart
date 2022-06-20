import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/bloc/usuario/usuario_cubit.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            }, 
            icon: Icon(Icons.logout_rounded)
          )
        ],
      ),
      body: BodyScaffold(),

      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.accessibility_new ),
        onPressed: () => Navigator.pushNamed(context, 'pagina2')
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) { 

      switch (state.runtimeType) {
        case UsuarioInitial:
          return Center(child: Text('No hay información del usuario'));
          break;
        case UsuarioActivo:
          return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
          break;
        default:
          return Center(child: Text('Estado no reconocido'));
          break;
      }


      // if (state is UsuarioActivo) return InformacionUsuario(usuario: state.usuario);
      // return Center(child: Text('No hay información del usuario'));
    });
  }
}


class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({Key key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ListTile( title: Text('Nombre: ${ usuario.nombre }') ),
          ListTile( title: Text('Edad: ${ usuario.edad }') ), 

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),


          ...usuario.profesiones.map(
            (profesion) => ListTile( title: Text( profesion ))
          ).toList()
          

        ],
      ),
    );
  }

}