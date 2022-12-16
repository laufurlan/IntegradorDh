import { BsFacebook, BsTwitter,  BsInstagram } from 'react-icons/bs';
import { FaLinkedinIn } from 'react-icons/fa';
import React from "react";

const FooterSocialContact = () =>{
  return(
      <nav>
        <ul>
          <li><BsFacebook /></li>
          <li><FaLinkedinIn /></li>
          <li><BsTwitter /></li>
          <li><BsInstagram /></li>
        </ul>
      </nav>
  );
}

export default FooterSocialContact;