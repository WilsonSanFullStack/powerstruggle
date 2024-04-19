'use client'

import { headers } from "next/headers"
import { ChangeEvent, FormEvent, useState } from "react"


export default function RegisterUser () {
  const [register, setRegister] = useState({
    firstName: '',
    lastName: '',
    email: '',
  })

  const handleFirstName = (event:ChangeEvent<HTMLInputElement>) => {
    setRegister({
      ...register,
      firstName: event.target.value,
    })
  } 
  const handleLastName = (event:ChangeEvent<HTMLInputElement>) => {
    setRegister({
      ...register,
      lastName: event.target.value,
    })
  } 
  const handleEmail = (event:ChangeEvent<HTMLInputElement>) => {
    setRegister({
      ...register,
      email: event.target.value,
    })
  } 
  const handleSubmit = async (event:FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    try {
      const res = await fetch(`${process.env.NEXT_PUBLIC_URL}/api/user`, {
        method: "POST",
        body: JSON.stringify(register),
        headers: { "Content-Type": "application/json" },
      });
      const data = await res.json();
      console.log(data)
    } catch (error) {
      console.log(error)
    }
  }
  return (
    <div>
      <form onSubmit={handleSubmit}>
        <section>
          <section>
            <label>First Name*</label>
            <input type="text"
            id="firstname"
            placeholder="wilson"
            value={register.firstName}
            onChange={handleFirstName}
            />
          </section>
          
          <section>
            <label>Last Name*</label>
            <input type="text"
            id="lastname"
            placeholder="sanchez"
            value={register.lastName}
            onChange={handleLastName}
            />
          </section>
          <section>
            <label>Email*</label>
            <input type="text"
            id="email"
            placeholder="example@example.com"
            value={register.email}
            onChange={handleEmail}
            />
          </section>
        </section>
        <section>
          <button type="submit">Enviar</button>
        </section>
      </form>
    </div>
  )
}