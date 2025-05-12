import "package:http/http.dart" as http;
import "dart:convert";

Future<String> getBitcoinPrice() async {
  String price = "R\$ 0,00";
  final url = Uri.parse("https://blockchain.info/ticker");
  http.Response response = await http.get(url);
  Map<String, dynamic> data = json.decode(response.body);

  price = 'R\$ ${(data["BRL"]['buy'] ?? 0.00).toString()}';
  return price;
}
