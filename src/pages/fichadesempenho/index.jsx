import Image from 'next/image'
import { useEffect, useState } from 'react'
import banner from '../../assets/banner_classroom.jpg'

export default function FichaDeDesempenho ({ sessionUser }) {

    const [session, setSession] = useState()

    // useEffect(() => {setSession(sessionUser)}, [])
   

    return (
        <div>
            {/* Top */}
            <div className='flex flex-col items-center'>
                <Image className="w-full h-56 mr-2 object-cover" src={banner} alt="logo" />
                <h1 className='text-center text-4xl font-bold animate-bounce-slow text-gray-700'>Ficha de Desempenho</h1>
                <span className='shadow-xl w-64 h-8 animate-bounce-slow'></span>
            </div>
        </div>
    )
}