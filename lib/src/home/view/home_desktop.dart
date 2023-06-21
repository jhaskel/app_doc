
import 'package:app_doc/src/home/view/tabs.dart';
import 'package:app_doc/src/utils/widgets/texxto.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';



class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  int selectedPage = 0;

  final pages = [MyApp(), PageTwo(),PageThree(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Texxto(text: "ORSE",),
      ),
   //   drawer: MenuDrawer(),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedPage,
          fixedColor: Colors.blueAccent,
          unselectedItemColor: Color(0xFF757575),
          onTap: (position) {
            setState(() {
              selectedPage = position;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "protocolos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Ordem de Serviços"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Cadastro")
          ]),
    );
  }
}



// Page One
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.indigo,
      child: const Text(
        'Page 1',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ),
    );
  }
}

// Page Two
class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {

  @override
  Widget build(BuildContext context) {
    final successAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Transaction Completed Successfully!',
          autoCloseDuration: const Duration(seconds: 2),
        );
      },
      title: 'Success',
      text: 'Transaction Completed Successfully!',
      leadingImage: 'assets/images/success.gif',
    );

    final errorAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Sorry, something went wrong',
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          textColor: Colors.white,
        );
      },
      title: 'Error',
      text: 'Sorry, something went wrong',
      leadingImage: 'assets/images/error.gif',
    );

    final warningAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          text: 'You just broke protocol',
        );
      },
      title: 'Warning',
      text: 'You just broke protocol',
      leadingImage: 'assets/images/warning.gif',
    );

    final infoAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          text: 'Buy two, get one free',
        );
      },
      title: 'Info',
      text: 'Buy two, get one free',
      leadingImage: 'assets/images/info.gif',
    );

    final confirmAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          text: 'Do you want to logout',
          confirmBtnText: 'Yes',
          cancelBtnText: 'No',
          confirmBtnColor: Colors.white,
          backgroundColor: Colors.black,
          confirmBtnTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          barrierColor: Colors.white,
          titleColor: Colors.white,
          textColor: Colors.white,
        );
      },
      title: 'Confirm',
      text: 'Do you want to logout',
      leadingImage: 'assets/images/confirm.gif',
    );

    final loadingAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          title: 'Loading',
          text: 'Fetching your data',
        );
      },
      title: 'Loading',
      text: 'Fetching your data',
      leadingImage: 'assets/images/loading.gif',
    );

    final customAlert = buildButton(
      onTap: () {
        var message = '';
        QuickAlert.show(
          context: context,
          type: QuickAlertType.custom,
          barrierDismissible: true,
          confirmBtnText: 'Save',
          customAsset: 'assets/images/custom.gif',
          widget: TextFormField(
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Enter Phone Number',
              prefixIcon: Icon(
                Icons.phone_outlined,
              ),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            onChanged: (value) => message = value,
          ),
          onConfirmBtnTap: () async {
            if (message.length < 5) {
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'Please input something',
              );
              return;
            }
            Navigator.pop(context);
            await Future.delayed(const Duration(milliseconds: 1000));
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: "Phone number '$message' has been saved!.",
            );
          },
        );
      },
      title: 'Custom',
      text: 'Custom Widget Alert',
      leadingImage: 'assets/images/custom.gif',
    );

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Throw Error'),
              onPressed: () {
                throw Exception('An error has occurred!');
              },
            ),

      ElevatedButton(
        child: Text('Throw Error'),
        onPressed: () {
          throw Exception('An error has occurred!');
        },

      ),
            const SizedBox(height: 20),
            successAlert,
            const SizedBox(height: 20),
            errorAlert,
            const SizedBox(height: 20),
            warningAlert,
            const SizedBox(height: 20),
            infoAlert,
            const SizedBox(height: 20),
            confirmAlert,
            const SizedBox(height: 20),
            loadingAlert,
            const SizedBox(height: 20),
            customAlert,
            const SizedBox(height: 20),


          ],
        ),
      ),
    );

  }

   Card buildButton({
     required Null Function() onTap,
     required String title,
     required String text,
     required String leadingImage}) {


      return Card(
        shape: const StadiumBorder(),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              leadingImage,
            ),
          ),
          title: Text(title ?? ""),
          subtitle: Text(text ?? ""),
          trailing: const Icon(
            Icons.keyboard_arrow_right_rounded,
          ),
        ),
      );
    }
  }


// Page Three
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.amber,
        child: const Text(
          'Page 3',
          style: TextStyle(fontSize: 50, color: Colors.black),
        ));
  }
}