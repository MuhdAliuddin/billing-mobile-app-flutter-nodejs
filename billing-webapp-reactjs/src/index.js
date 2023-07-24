import "react-app-polyfill/stable";
import "core-js";
import React from "react";
import ReactDOM from "react-dom";
import App from "./App";
import reportWebVitals from "./modules/utilities/reportWebVitals";
import { Provider } from "react-redux";
import store from "./modules/repositories/store";
import { ThemeProvider, createTheme } from "@mui/material/styles";
import { red } from "@mui/material/colors";

import _theme from "./components/resources/scss/_theme.scss";

export const theme = createTheme({
  palette: {
    primary: {
      main: _theme.primary,
    },
    secondary: {
      main: _theme.secondary,
    },
  },
});

ReactDOM.render(
  <Provider store={store}>
    <ThemeProvider theme={theme}>
      <App />
    </ThemeProvider>
  </Provider>,
  document.getElementById("root")
);

// If you want to start measuring performance in your app, pass abc
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
