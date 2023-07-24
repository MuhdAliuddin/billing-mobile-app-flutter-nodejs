import React, { useEffect, useState } from 'react'
import PropTypes from 'prop-types'

import LoginView from './login_view'
import { Loading } from '../../components/drawable/loading'

import { Navigate } from 'react-router-dom'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { authorizing, login } from '../../modules/repositories/login/actions'
import { LOGIN_STATE } from '../../modules/repositories/login/creator'

const LoginController = (props) => {
  const { logon, error, authorizing, login } = props

  const [email, setEmail] = useState('')
  const [emailValid, setEmailValid] = useState(false)
  const [emailInvalid, setEmailInvalid] = useState(false)
  const [emailInvalidFeedback, setEmailInvalidFeedback] = useState('Email is required')
  const [password, setPassword] = useState('')
  const [passwordInvalid, setPasswordInvalid] = useState(false)
  const [passwordValid, setPasswordValid] = useState(false)
  const [passwordInvalidFeedback, setPasswordInvalidFeedback] = useState('Password is required')
  const [formValidated, setFormValidated] = useState(false)
  const [formInvalid, setFormInvalid] = useState(false)
  const [formInvalidFeedback, setFormInvalidFeedback] = useState(
    'Email and Password do not matched',
  )
  const [user, setUser] = useState('User')
  const onEmailChanged = (userEmail) => {
    if (userEmail === '') {
      setEmailInvalidFeedback('Field is required')
      if (formValidated) {
        setEmailInvalid(true)
        setEmailValid(false)
      }
    } else {
      setEmailInvalidFeedback('')
      if (formValidated) {
        setEmailInvalid(false)
        setEmailValid(true)
      }
    }

    if (/^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[A-Za-z]+$/.test(userEmail)) {
      setEmailInvalidFeedback('')
      if (formValidated) {
        setEmailInvalid(false)
        setEmailValid(true)
      }
    } else {
      setEmailInvalidFeedback('Please provide a valid Email address')
      if (formValidated) {
        setEmailInvalid(true)
        setEmailValid(false)
      }
    }

    setFormInvalid(false)
    setEmail(userEmail)
  }
  const onPasswordChanged = (passwd) => {
    if (passwd === '') {
      setPasswordInvalidFeedback('Field is required')
      if (formValidated) {
        setPasswordInvalid(true)
        setPasswordValid(false)
      }
    } else {
      setPasswordInvalidFeedback('')
      if (formValidated) {
        setPasswordInvalid(false)
        setPasswordValid(true)
      }
    }

    if (passwd.length < 6) {
      setPasswordInvalidFeedback('Password must be longer than 6 characters')
      if (formValidated) {
        setPasswordInvalid(true)
        setPasswordValid(false)
      }
    } else {
      setPasswordInvalidFeedback('')
      if (formValidated) {
        setPasswordInvalid(false)
        setPasswordValid(true)
      }
    }

    setFormInvalid(false)
    setPassword(passwd)
  }
  const onUserForgotPassword = () => {}

  const onUserLogin = (valid) => {
    setFormValidated(true)

    if (password.length < 6 && password !== '') {
      setPasswordInvalidFeedback('Password must be longer than 6 characters')
      setPasswordInvalid(true)
      setPasswordValid(false)
      return
    }
    if (valid) {
      login(email, password)
    }
  }

  useEffect(() => {
    if (logon === LOGIN_STATE.ERROR) {
      setFormInvalid(true)
      setFormInvalidFeedback(error)
    }
    if (logon === LOGIN_STATE.REFRESHED) {
      authorizing()
    }
  }, [logon, error, authorizing])

  if (logon === LOGIN_STATE.AUTHORIZED) {
    return <Navigate to={'/'} replace={true} />
  }
  if (logon === LOGIN_STATE.UNAUTHORIZED || logon === LOGIN_STATE.ERROR) {
    return (
      <LoginView
        state={{
          email: email,
          emailValid: emailValid,
          emailInvalid: emailInvalid,
          emailInvalidFeedback: emailInvalidFeedback,
          password: password,
          passwordValid: passwordValid,
          passwordInvalid: passwordInvalid,
          passwordInvalidFeedback: passwordInvalidFeedback,
          formValidated: formValidated,
          formInvalid: formInvalid,
          formInvalidFeedback: formInvalidFeedback,
          user: user,
        }}
        callback={{
          onLogin: onUserLogin,
          onEmailChange: onEmailChanged,
          onPasswordChange: onPasswordChanged,
          onForgotPassword: onUserForgotPassword,
          setUser: setUser,
        }}
      />
    )
  }
  return <Loading />
}

const actionToPropMap = (dispatch) => {
  return bindActionCreators(
    {
      authorizing,
      login,
    },
    dispatch,
  )
}

const stateToPropMap = (state) => ({
  logon: state.login.status,
  error: state.login.message,
})

LoginController.propTypes = {
  logon: PropTypes.string,
  error: PropTypes.string,
  login: PropTypes.func,
  authorizing: PropTypes.func,
}

export default connect(stateToPropMap, actionToPropMap)(LoginController)
