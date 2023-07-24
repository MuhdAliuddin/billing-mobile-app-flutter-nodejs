import { applyMiddleware, createStore } from 'redux'
import { composeWithDevTools } from 'redux-devtools-extension'
import thunk from 'redux-thunk'
import logger from 'redux-logger'
import reducers from '.'

import { REDUX_LOGGER_ENABLE } from '../../components/resources/constants'

let middleware
if (REDUX_LOGGER_ENABLE) {
  middleware = applyMiddleware(thunk, logger)
} else {
  middleware = applyMiddleware(thunk)
}

const store = createStore(reducers, composeWithDevTools(middleware))
export default store
