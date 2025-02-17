import 'package:flutter/material.dart';

class DonativosPage extends StatelessWidget {
  final Map<String, dynamic> donativosData;
  DonativosPage({
    Key? key, required this.donativosData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donativos obtenidos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset("assets/icons/paypal_logo.png"),
              trailing: Text(
                "${donativosData["totalPaypal"]}", // sustituir por los datos que recibimos
                style: TextStyle(fontSize: 32),
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Image.asset("assets/icons/creditcard_logo.png"),
              trailing: Text(
                "${donativosData["totalTarjeta"]}",
                style: TextStyle(fontSize: 32),
              ),
            ),
            SizedBox(height: 24),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money, size: 64),
              trailing: Text(
                "${donativosData["totalPaypal"] + donativosData["totalTarjeta"]}",
                style: TextStyle(fontSize: 32),
              ),
            ),
            if((donativosData["totalPaypal"]+donativosData["totalTarjeta"]) >= donativosData["donacionesTope"])
              Image.asset("assets/icons/gracias.png")
            else
              Container()
          ],
        ),
      ),
    );
  }
}
