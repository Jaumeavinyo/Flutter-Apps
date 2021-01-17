import 'package:aquarium/Widgets/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  bool _insideAquarium = false;
  int _index = 0;
  String _uid = 'glenncl5@gmail.com';

  @override
  Widget _buildErrorPage(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildForum(QuerySnapshot snapshot, QuerySnapshot lastvarSnapshot) {
    final docs = snapshot.docs;
    final lastvar = lastvarSnapshot.docs[0];
    bool insideAquarium = _insideAquarium;

    if (insideAquarium == false)
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, int index) {
            final aquarium = docs[index];
            return Card(
              child: InkWell(
                child: ListTile(
                  title: Text("${aquarium['Nick']}'s Aquarium"),
                ),
                onTap: () {
                  setState(() {
                    _index = index;
                    _insideAquarium = !_insideAquarium;
                    _uid = docs[index].id;
                  });
                },
              ),
            );
          },
        ),
      );
    else if (insideAquarium == true)
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Last Variables',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    LastVariablesText(variables: lastvar),
                    SizedBox(height: 30),
                    Text(
                      'Desired Variables',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    DesiredVariables(aquarium: docs[_index]),
                    SizedBox(height: 30),
                    Text(
                      'Graph',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset('assets/images/graph.jpg'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 1,
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _insideAquarium = !_insideAquarium;
                    });
                  },
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final aquariums = FirebaseFirestore.instance
        .collection('Aquariums')
        .where('User', isNotEqualTo: user.email);
    final lastvar = FirebaseFirestore.instance
        .collection('Aquariums')
        .doc('$_uid')
        .collection('Variables')
        .orderBy('Fecha', descending: true);
    return StreamBuilder(
      stream: aquariums.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorPage(snapshot.error.toString());
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoading();
          case ConnectionState.active:
            return StreamBuilder(
              stream: lastvar.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> lastvarSnapshot) {
                return _buildForum(snapshot.data, lastvarSnapshot.data);
              },
            );
          default: // ConnectionState.none  // ConnectionState.done
            return _buildErrorPage("Unreachable!!!");
        }
      },
    );
  }
}
