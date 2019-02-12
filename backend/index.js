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
exports.FUNCTIONNAME = functions.database.ref('path/{contextParameter}').onWrite((snapshot, context) => {
    // use context.params & snapshot.after.val() / snapshot.before.val() to get information

    // console.log("New Message: ")
    return loadPath(RELEVANT_PATH).then(sender => {
        // BEHAVIOR


        // Define a message using message_template

        // Send the message
        if (MULTIPLE_MESSAGES) {
            return admin.messaging().send(message)
        } else {
            admin.messaging().send(message)
            return 0
        }
    })
})


function copyJSON(object) {
    return JSON.parse(JSON.stringify(object))
}

function loadPath(path) {
  let dbRef = admin.database().ref(path);
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
