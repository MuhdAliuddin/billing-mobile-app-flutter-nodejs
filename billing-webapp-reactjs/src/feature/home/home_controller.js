import React, { useEffect } from "react";
import PropTypes from "prop-types";

import HomeView from "./home_view";
import { Loading } from "../../components/drawable/loading";

import { Navigate } from "react-router-dom";
import { connect } from "react-redux";
import { bindActionCreators } from "redux";
import { authorizing, logout } from "../../modules/repositories/login/actions";

import { LOGIN_STATE } from "../../modules/repositories/login/creator";

const HomeController = (props) => {
  const {
    logon,
    //logout
  } = props;

  useEffect(() => {
    if (logon === LOGIN_STATE.REFRESHED) {
      props.authorizing();
    }
  });

  // const onLogout = () => {
  //   logout()
  // }

  if (logon === LOGIN_STATE.REFRESHED) {
    return <Loading message="Loading ..." />;
  }
  if (logon === LOGIN_STATE.UNAUTHORIZED || logon === LOGIN_STATE.ERROR) {
    return <Navigate to={"/login"} replace={true} />;
  }
  if (logon === LOGIN_STATE.AUTHORIZED) {
    return <HomeView />;
  }
  return <Loading message="Logging you in ..." />;
};

HomeController.propTypes = {
  authorizing: PropTypes.func,
  logout: PropTypes.func,
  logon: PropTypes.string,
};

const storeToPropMap = (store) => ({
  logon: store.login.status,
});

const actionToPropMap = (dispatch) => {
  return bindActionCreators(
    {
      authorizing,
      logout,
    },
    dispatch
  );
};

export default connect(storeToPropMap, actionToPropMap)(HomeController);
