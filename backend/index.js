const functions = require('firebase-functions');
const admin = require('firebase-admin');

const message_template = {
    apns: {
        payload: {
          aps: {
            alert: {
                title: "title",
                subtitle: "subtitle",
                body: "body"
            },
            sound: "default",
          }
        }

      },
    token: "DEVICE FCM TOKEN HERE",
}

admin.initializeApp(functions.config().firebase);
exports.FUNCTIONNAME = functions.database.ref('PATH').onWrite((snapshot, context) => {
    // use context.params & snapshot.after.val() / snapshot.before.val() to get information
    console.log("This function has been triggered")
    return loadPath(RELEVANT_PATH).then(var => {
        // BEHAVIOR

        // define a message using message_template

        return admin.messaging().send(message)
    })
})


function loadPath(path) {
  let dbRef = admin.database().ref('/users/' + uid);
    let defer = new Promise((resolve, reject) => {
        dbRef.once('value', (snap) => {
            let data = snap.val();
            resolve(data);
        }, (err) => {
            reject(err);
        });
    });
    return defer;
}
