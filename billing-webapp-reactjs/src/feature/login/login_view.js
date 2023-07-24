import React from "react";
import PropTypes from "prop-types";

import {
  Button,
  Card,
  Typography,
  TextField,
  FormControl,
  FormGroup,
} from "@mui/material";

const LoginView = ({ state, callback }) => {
  return (
    <div>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          width: "100%",
          height: "100vh",
          background: "green",
        }}
      >
        <Card style={{ margin: "auto" }}>
          <FormControl sx={{ m: 3 }} component="fieldset" variant="standard">
            <Typography variant="h3">Login</Typography>
            <FormGroup>
              <TextField
                style={{ marginTop: "10%" }}
                id="email"
                label="Email"
                variant="standard"
              />
              <TextField
                style={{ marginTop: "10%" }}
                id="password"
                label="Password"
                variant="standard"
              />
              <Button variant="outlined" style={{ marginTop: "20%" }}>
                SUBMIT
              </Button>
            </FormGroup>
          </FormControl>
        </Card>
      </div>
    </div>
  );
};

LoginView.propTypes = {
  state: PropTypes.shape({
    email: PropTypes.string,
    emailValid: PropTypes.bool,
    emailInvalid: PropTypes.bool,
    emailInvalidFeedback: PropTypes.string,
    password: PropTypes.string,
    passwordValid: PropTypes.bool,
    passwordInvalid: PropTypes.bool,
    passwordInvalidFeedback: PropTypes.string,
    formValidated: PropTypes.bool,
    formInvalid: PropTypes.bool,
    formInvalidFeedback: PropTypes.string,
    user: PropTypes.string,
  }).isRequired,
  callback: PropTypes.shape({
    onLogin: PropTypes.func,
    onEmailChange: PropTypes.func,
    onPasswordChange: PropTypes.func,
    onForgotPassword: PropTypes.func,
    setUser: PropTypes.func,
  }).isRequired,
};

export default LoginView;
