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
exports.newMessage = functions.database.ref('chat/{msgID}').onWrite((snapshot, context) => {
    // use context.params & snapshot.after.val() / snapshot.before.val() to get information
    const msgData = snapshot.after.val()
    const senderID = msgData["sender"]
    const msgContents = msgData["msg"]
    const msgID = context.params.msgID

    console.log("New Message: " + msgID)
    return loadPath("users/" + senderID).then(sender => {
        // BEHAVIOR
        const senderName = sender["first"]

        // define a message using message_template
        var message = copyJSON(message_template)
        message.apns.payload.aps.alert = {title: senderName, body: msgContents}

        console.log(message);
        console.log(message.apns);
        console.log(message.apns.payload.aps);
        console.log(message.apns.payload.aps.alert);

        return loadPath("users").then(userList => {
            for (uid in userList) {
                var user = userList[uid]

                var token = user["fcm"]
                console.log(token);

                if (token !== undefined && token !== null && token !== "") {
                    console.log("Sending message with token: " + token)
                    console.log(message);
                    message.token = token
                    admin.messaging().send(message)
                }
            }
            return 0
        })
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
