import 'package:flutter/material.dart';
import 'package:nereyi_gezsem_bbt/AnaSayfa.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({super.key});

  @override
  State<GirisYap> createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {

  late String kullaniciadi;
  late String password;

  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    bool switchKontrol=false;

    return Scaffold(
      backgroundColor: Color(0xffF6F4F3),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top:100.0,left: 20.0, right: 20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    child: SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: Image.asset(("resimler/logo.jpg")),
                    ),
                  ),
                ),
              ),

                 TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(color: Colors.teal),
                    ),
                    labelText: "Kullanıcı Adı",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Kullanıcı adı giriniz.";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (String? value){
                    kullaniciadi=value!;
                  },
                ),

                SizedBox(height: 20.0,),

                TextFormField(
                  obscureText: true, //Şifre girerken saklama
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide (color:Colors.teal),
                    ),
                    labelText: "Şifre",
                    labelStyle:TextStyle(color: Colors.black) ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),
                  validator: (String? value){
                    if(value!.isEmpty){
                      return "Şifrenizi giriniz.";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (String? value){
                    password=value!;
                  },
                ),
              SizedBox(height: 15.0,),

              Row(
                children: [
                  Text("Beni Hatırla",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  Switch(
                    value: switchKontrol,
                    activeTrackColor:Colors.white24,
                    activeColor: Colors.teal,
                    inactiveTrackColor: Colors.white24,
                    inactiveThumbColor: Colors.white10,
                    onChanged: (veri){
                      setState(() {
                        switchKontrol=veri;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 15.0,),

              _loginButton(),

              SizedBox(height: 20.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      child: Text("Üye Ol", style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Colors.black54)
                        ),
                      ),
                      onPressed: (){

                      },
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      child: Text("Şifremi Unuttum", style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shadowColor: Colors.redAccent,
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Colors.black54)
                        ),
                      ),
                      onPressed: (){

                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() =>
      SizedBox(
        width: 400.0,
        height: 50.0,
        child: ElevatedButton(
          child: Text("Giriş Yap.", style: TextStyle(color: Colors.black),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade400,
            shadowColor: Colors.tealAccent,
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.black54)
            ),
          ),
          onPressed: ()
          => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => anaSayfa()),
          ),
          /*
          onPressed: (){
            if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
              //debugPrint("e-posta : $eposta, şifre: $password");
              if(kullaniciadi=="a" && password=="a"){
                anaSayfa();
                debugPrint("Giriş Başarılı.");

              }
              else{
                showDialog(
                    barrierDismissible: false, //Hata mesajından sonra boş kısıma tıklayarak çıkamaz.
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        backgroundColor: Colors.grey.shade300,
                        title: Text("Hata"),
                        content: Text("Giriş bilgileriniz hatalı. Lütfen tekrar giriniz."),
                        actions: [
                          MaterialButton(
                            child: Text("Geri Dön"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    }
                );
              }
            }
          },*/
        ),
      );


}


