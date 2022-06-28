#### Pay with paypal button

```
body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    ////// Payment ////
                    builder: (context) => const PaypalPayment(
                      // change to a variable to present how much to pay
                      amount: 5.99,
                      currency: 'USD',
                    ),
                  ));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Pay with Paypal',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
```

#### Payment account (if needed)

Email: sb-i7aiw16758642@personal.example.com
Password: a4C3#xS6
