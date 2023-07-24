export const getDashboardApi = async () => {
  let promise = new Promise((resolve) => {
    resolve(
      [
        {
          id: 1,
          text: 'Dashboard'
        }
      ]
    )
    return
  })
  return promise
}
