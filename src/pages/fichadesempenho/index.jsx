import Layout from '@/components/layout'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'

export default function FichaDeDesempenho () {

    const [session, setSession] = useState(null)
    const [load, setLoad] = useState(false)
    const router = useRouter()


    useEffect(() => {
        if (localStorage.getItem('user')){
            setSession(localStorage.getItem('user'))
            setLoad(true)
        }
        else {
            router.push('/')
        }
      }, [])    

    return (
        load ? <></> :
        <h1>Ficha de Desempenho</h1>
        // <Layout sessionUser={session}>
        //     <h1>Ficha de Desempenho</h1>
        // </Layout>
    )
}