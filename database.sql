
-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) UNIQUE NOT NULL,
    "password" VARCHAR (1000) NOT NULL,
    "clearance_level" INTEGER NOT NULL DEFAULT 0
);

INSERT INTO "user" ("username", "password", "clearance_level")
VALUES ('Admiral Greer', 'tuna', 18),
('Captain Borodin', 'shark', 10),
('Lieutenant Nguyen', 'fishy', 4),
('Lieutenant Ryan', 'tuna', 4);


CREATE TABLE "secret" (
    "id" SERIAL PRIMARY KEY,
    "content" VARCHAR (80) UNIQUE NOT NULL,
    "secrecy_level" INTEGER NOT NULL DEFAULT 0
);

INSERT INTO "secret" ("content", "secrecy_level")
VALUES ('Admirals Only: Captain Borodin is totally weird.', 13),
('Captains Or Above: Lieutenant Ryan is looking fly.', 6),
('Lieutenants Or Above: We are heading to the Bahamas.', 3);


import React from "react";
import { connect } from "react-redux";
import mapStoreToProps from "../../redux/mapStoreToProps";
import BarcodeScannerComponent from "react-webcam-barcode-scanner";
import { render } from "react-dom";

class Barcode extends React.Component {

    state = {
        data : 'Not Found',
    }
 getBook = () => {
                  this.props.dispatch({
                    type: "GET_BOOK",
                    payload: this.state.data,
                  });


  };
render() {
  return (
    <>
      <BarcodeScannerComponent
        width={500}
        height={500}
        onUpdate={(err, result) => {
          if (result) {this.setState({
              data : result})};
        }}
      />
      <p>{this.state.data}</p>
    </>
  )};
}

export default connect(mapStoreToProps)(Barcode);