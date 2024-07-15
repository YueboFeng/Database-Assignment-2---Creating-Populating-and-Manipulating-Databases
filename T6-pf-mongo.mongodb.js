// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-pf-mongo.mongodb.js

// Student ID: 34692959
// Student Name: Yuebo Feng
// Unit Code: FIT9132
// Applied Class No: 10am Fri

// Comments for your marker:

// ===================================================================================
// Do not modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("yfen0071");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.clinics.drop();

// Create collection and insert documents
db.createCollection('clinics');
db.clinics.insertMany
(
    [
        {
            _id: 5,
            name: 'Brighton East Pet Care',
            address: '123 Thomas St, Brighton East VIC 3187',
            phone: '0398765412',
            head_vet: 
            {
                id: 1007,
                name: 'Jessica Lee'
            },
            no_of_vets: 3,
            vets:
            [
                {
                    "id": 1007,
                    "name": "Jessica Lee",
                    "specialisation": "Behavioral Medicine"
                    },
                    {
                    "id": 1010,
                    "name": "Michael Clarkson",
                    "specialisation": "Cardiology"
                    },
                    {
                    "id": 1009,
                    "name": "Sarah Morris",
                    "specialisation": "N/A"
                    }
                    
            ]
        }
    ]
)

// List all documents you added
db.clinics.find().pretty();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.clinics.find
(
    {
        'vets.specialisation':
        {
            $in:
            [
                'Dermatology',
                'Cardiology'
            ]
        }
    },
    {
        name: 1,
        address: 1
    }
);

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Show document before the new vet is added
db.clinics.find({_id: 5}).pretty();

// Add new vet and set the vet as the head of clinic
db.clinics.updateOne
(
    {
        _id: 5
    },
    {
        $push:
        {
            vets:
            {
                id: 1020,
                name: 'Sarah Wilkinson',
                specialisation: 'Dentistry'
            }
        },
        $set:
        {
            'head_vet.id': 1020,
            'head_vet.name': 'Dentistry',
            no_of_vets: 4
        }
    }
);

// Illustrate/confirm changes made
db.clinics.find({_id: 5}).pretty();
