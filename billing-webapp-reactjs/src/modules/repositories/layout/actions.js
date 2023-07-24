import ACTION from './creator'

export const setLayout = (keyValue) => (dispatch) => {
  dispatch({ type: ACTION.SET, keyValue })
}

const LayoutAction = {
  setLayout,
}

export default LayoutAction
