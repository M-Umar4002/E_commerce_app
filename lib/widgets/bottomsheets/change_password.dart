import 'package:flutter/material.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  State<ChangePasswordBottomSheet> createState() =>
      _ChangePasswordBottomSheetState();
}

class _ChangePasswordBottomSheetState extends State<ChangePasswordBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            12, 18, 12, MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Password Change',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 4),
              height: 58,
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: const Color(0xffF5F5F5),
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  fillColor: const Color(0xff2A2C36),
                  filled: true,
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xff2A2C36))),
                  labelText: 'Old Password',
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.labelMedium,
                    ))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 22, bottom: 12),
              height: 58,
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: const Color(0xffF5F5F5),
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  fillColor: const Color(0xff2A2C36),
                  filled: true,
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xff2A2C36))),
                  labelText: 'New Password',
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            SizedBox(
              height: 58,
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: const Color(0xffF5F5F5),
                style: Theme.of(context).textTheme.titleSmall,
                decoration: InputDecoration(
                  fillColor: const Color(0xff2A2C36),
                  filled: true,
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xff2A2C36))),
                  labelText: 'Repeat New Password',
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEF3651),
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {},
                child: Text(
                  'SAVE PASSWORD',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
