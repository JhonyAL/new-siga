import { Navbar } from './Navbar'
import { Footer } from './Footer'
import { useEffect, useState } from 'react'
import './layout.css'
 
export default function Layout({ children, sessionUser }) {
  const [user, setUser] = useState(JSON.parse(sessionUser))
  useEffect(() => {console.log(user.NOME)}, [])

  return (
    <>
        
      <Navbar perfil={user}/>
        <main className='bg-white main'>{children}</main>
      {/* <Footer className="footer"/> */}
    </>
  )
}