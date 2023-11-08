import Layout from '@/components/layout'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'

export default function FichaDeDesempenho () {

    const [session, setSession] = useState(null)
    const [load, setLoad] = useState(false)
    const router = useRouter()

    useEffect(() => {document.title = "Ficha de Desempenho"}, [])
   

    return (
        <div>Ficha de Desempenhoasdasdsadasdsadsad</div>
        // <Layout sessionUser={session}>
        //     <h1>Ficha de Desempenho</h1>
        // </Layout>
    )
}