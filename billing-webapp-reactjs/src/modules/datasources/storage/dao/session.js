export const sessionSaveJson = (key,json) => {
    sessionStorage.setItem(key, JSON.stringify(json))
}

export const sessionGetJson = (key) => {
    let jsonStr =  sessionStorage.getItem(key)
    try{
     return JSON.parse(jsonStr)
    }
    catch(e){
     return null
    }
 }
 
 export const sessionDelete = () => {
     sessionStorage.clear()
 }