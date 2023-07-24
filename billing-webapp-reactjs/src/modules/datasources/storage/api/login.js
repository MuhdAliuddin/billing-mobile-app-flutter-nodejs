import { localSaveJson, localGetJson, localDelete } from '../dao/local'
import { LOGIN } from '../redis'

export const setLogin = (login) => {
  localSaveJson(LOGIN.CREDENTIALS, login)
}

export const getLogin = () => {
  return localGetJson(LOGIN.CREDENTIALS)
}

export const clrLogin = () => {
  localDelete()
}
