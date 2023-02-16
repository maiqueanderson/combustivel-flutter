import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class MaterialApp {
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String textInfo = "Insira os Dados do Carro!";

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //os codigos abaixo pegam o que o usuario digitar
  // deve atribuir um controller dentro do TextFild de cada


  TextEditingController consumoAlcool = TextEditingController();
  TextEditingController consumoGasolina = TextEditingController();
  TextEditingController precoAlcool = TextEditingController();
  TextEditingController precoGasolina = TextEditingController();

  void _restFilds(){


    consumoAlcool.text = "";
    consumoGasolina.text = "";
    precoAlcool.text = "";
    precoGasolina.text = "";

    setState(() {
      textInfo = "Insira os dados do Carro!";
    });

  }

  //essa função é responsavel por atribuir o texto digitado a uma variavel
  void calculo(){
    // comando para atualizar a pagina do app
    setState(() {

      double cAlcool = double.parse(consumoAlcool.text);
      double cGasolina = double.parse(consumoGasolina.text);
      double pAlcool = double.parse(precoAlcool.text);
      double pGasolina = double.parse(precoGasolina.text);
      double resultG = pGasolina / cGasolina;
      double resultA = pAlcool / cAlcool;

      if(resultG > resultA){
        textInfo = "Alcool custo de ${resultA.toStringAsPrecision(2)} Por Km rodado";

      }else{
        textInfo = "Gasolina custo de ${resultG.toStringAsPrecision(2)} Por Km rodado";



      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina?"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _restFilds,
          )
        ],
      ),
      backgroundColor: Colors.white,
      // o comando abaixo serve para o teclado sobrepor as informações
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[

              //o comando abaixo serve para colocar um icone na tela
              Icon(
                Icons.directions_car,
                size: 120,
                color: Colors.green,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Consumo no Alcool (Km)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
                //este controller esta puxando o comando utilizado acima
                //para poder pegar o texto digitado pelo usuario
                controller: consumoAlcool,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira o Consumo no Alcool";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Consumo na Gasolina (Km)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
                //este controller esta puxando o comando utilizado acima
                //para poder pegar o texto digitado pelo usuario
                controller: consumoGasolina,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira o Cosumo a gasolina";
                  }
                },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Alcool",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
                //este controller esta puxando o comando utilizado acima
                //para poder pegar o texto digitado pelo usuario
                controller: precoAlcool,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira o Preço do Alcool";
                  }
                },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
                //este controller esta puxando o comando utilizado acima
                //para poder pegar o texto digitado pelo usuario
                controller: precoGasolina,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira o Preço da Gasolina";
                  }
                },
              ),

              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: (){
                      if(_formkey.currentState!.validate()){
                        calculo();
                                           }
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                        title: const Text('É melhor abastecer com:'),
                        content:  Text('$textInfo'),
                        actions: <Widget>[

                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ));

                    },
                    child: Text("Calcular", style: TextStyle(fontSize: 25.0),),


                  ),
                ),
              ),
              Text(textInfo,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0)),
            ],
          ),
        ),
      ),
    );
  }
}
