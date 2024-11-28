import 'package:flutter/material.dart';

class Release_Client extends StatefulWidget {
  const Release_Client({super.key});

  @override
  _ReleaseClientState createState() => _ReleaseClientState();
}

class _ReleaseClientState extends State<Release_Client> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _representativeController = TextEditingController();
  final TextEditingController _rfcController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8470A1),
      body: SafeArea(
        child: Column(
          children: [
            buildTitle(context),
            buildFormContainer(),
          ],
        ),
      ),
    );
  }

  // Método para el título del formulario
  Widget buildTitle(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        const Text(
          'Registro de Clientes',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 48),
      ],
    ),
  );
}

  
  Widget buildFormContainer() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF2F2740),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildTextField(_nameController, 'Nombre del Cliente'),
              buildTextField(_representativeController, 'Representante'),
              buildTextField(_rfcController, 'RFC'),
              buildTextField(_addressController, 'Dirección'),
              buildTextField(_phoneController, 'Teléfono'),
              buildTextField(_emailController, 'Correo Electrónico'),
              const SizedBox(height: 20),
               ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  'Agregar',
                  style: TextStyle(color: Color(0xFF2F2740), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget buildTextField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),
          filled: true,
          fillColor: const Color(0xFF463D5E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }


  void submitForm() {
  
    print('Formulario enviado');
  }


 
}


class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
