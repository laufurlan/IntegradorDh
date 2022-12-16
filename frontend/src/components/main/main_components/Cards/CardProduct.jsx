import React from "react";
import icon_Star from "../../../img/icon_Star.png";
import icon_location from "../../../img/icon_location.png";
import icon_favorite from "../../../img/icon_favorite.png";
import { Link } from "react-router-dom";
import { AiFillCar } from "react-icons/ai";
import { MdOutlineMicrowave, MdPets } from "react-icons/md";
import { BiSun } from "react-icons/bi";
import { TbDeviceTvOld, TbSwimming } from "react-icons/tb";
import { AiOutlineWifi } from "react-icons/ai";
import { TbBarbell } from "react-icons/tb";
import { CgSmartHomeRefrigerator } from "react-icons/cg";

const CardProduct = ({ p }) => {
  const limit = 4;
  const attributes = p.attributes.slice(0, limit);
  return (
    <div className="card">
      <section className="container-image">
        <img className="image-main" src={p.url_image} alt="" />
        <div className="icon-favorite">
          <img src={icon_favorite} alt="" />
        </div>
      </section>

      <section className="container-information">
        <div className="container-header">
          <div className="title-and-star-score">
            <div className="title-star-icon">
              <h3>{p.category_name}</h3>
              <ul>
                <li>
                  <img src={icon_Star} alt="" />
                </li>
                <li>
                  <img src={icon_Star} alt="" />
                </li>
                <li>
                  <img src={icon_Star} alt="" />
                </li>
                <li>
                  <img src={icon_Star} alt="" />
                </li>
                <li>
                  <img src={icon_Star} alt="" />
                </li>
              </ul>
            </div>
          </div>
          <div className="score">
            <h3>Muy bueno</h3>
            <div>
              <p>8</p>
            </div>
          </div>
        </div>
        <h2>{p.title}</h2>
        <div className="location-icon">
          <img src={icon_location} alt="" />
          <p>
            {p.city_name}
            <strong>mostrar en el mapa</strong>
          </p>
        </div>
        <div className="attributes">
          {attributes.length > 0 && attributes[0].id === 1 && <MdOutlineMicrowave />}

          {attributes.length > 1 && attributes[1].id === 2 && <TbDeviceTvOld />}

          {attributes.length > 2 && attributes[2].id === 3 && <BiSun />}

          {attributes.length > 3 && attributes[3].id === 4 && <MdPets />}

          {attributes.length > 4 && attributes[4].id === 5 && <AiFillCar />}

          {attributes.length > 5 && attributes[5].id === 6 && <TbSwimming />}

          {attributes.length > 6 && attributes[6].id === 7 && <AiOutlineWifi />}

          {attributes.length > 7 && attributes[7].id === 8 && <TbBarbell />}

          {attributes.length > 8 && attributes[8].id === 9 &&  <CgSmartHomeRefrigerator />}
        </div>

        <div className="description">
          <p>
            {p.description}
            <strong>más...</strong>
          </p>
        </div>
        <div className="content-btn">
          <Link to={`/product-detail/${p.id}`}>
            {" "}
            <button className="see_more">ver más</button>{" "}
          </Link>
        </div>
      </section>
    </div>
  );
};

export default CardProduct;
