import { getLogin } from '../storage/api/login'

export const loginApi = async ({ email, password }) => {
  let promise = new Promise((resolve, reject) => {
    if (email === 'system@tester.com' && password === '12345678') {
      resolve({
        token: 'random-access-token',
        ttl: '5000',
        name: 'System Developer',
        id: '1',
        role: 'Developer',
        contact: '+60137845847',
        created: new Date(),
      })
      return
    }
    reject('Login failed! Please check you username and password')
  })
  return promise
}

export const logoutApi = async () => {
  const credential = getLogin()
  let promise = new Promise((resolve, reject) => {
    if (credential.token) {
      return resolve()
    }
    reject('Invalid session, user credential not found!')
  })
  return promise
}
