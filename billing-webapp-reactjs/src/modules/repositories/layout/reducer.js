import ACTION from './creator'

const initialState = {
  asideShow: false,
  sidebarUnfoldable: false,
  sidebarShow: true,
}

const Layout = (state = initialState, { type, ...rest }) => {
  switch (type) {
    case ACTION.SET:
      return { ...state, ...rest }
    default:
      return state
  }
}

export default Layout
