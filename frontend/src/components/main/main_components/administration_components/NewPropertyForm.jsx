import React from "react";
import { useState, useEffect } from "react";
import { AiFillCar } from "react-icons/ai";
import { MdOutlineMicrowave, MdPets } from "react-icons/md";
import { BiSun } from "react-icons/bi";
import { TbDeviceTvOld, TbSwimming } from "react-icons/tb";
import { AiOutlineWifi } from "react-icons/ai";
import { TbBarbell } from "react-icons/tb";
import { CgSmartHomeRefrigerator } from "react-icons/cg";
import ModalSuccesReservation from "../../main_components/reservation_components/ModalSuccesReservation";


const NewPropertyForm = () => {
  const [cities, setCities] = useState([]);
  const [categories, setCategories] = useState([]);
  const [attributes, setAttributes] = useState([]);
  const [selectedImage, setSelectedImage] = useState(null);
  const [selectedImage1, setSelectedImage1] = useState(null);
  const [selectedImage2, setSelectedImage2] = useState(null);
  const [selectedImage3, setSelectedImage3] = useState(null);
  const [selectedImage4, setSelectedImage4] = useState(null);
  const jwt = JSON.parse(sessionStorage.getItem("jwt"));
  const [ showModalInvalid, setShowModaleInvalid ] = useState(false);
  const [ showModalInvalid1, setShowModaleInvalid1 ] = useState(false);
  const [ showModalInvalid2, setShowModaleInvalid2 ] = useState(false);
  const [showSuccesModal, setShowSuccesModal] = useState(false);
  const setShowModalInvalid = () =>{
    setShowModaleInvalid(false);
  }
  const setShowModalInvalid1 = () =>{
    setShowModaleInvalid1(false);
  }

  const setShowModalInvalid2 = () =>{
    setShowModaleInvalid2(false);
  }



  const [values, setValues] = useState({
    name: "",
    adress: "",
    city: "",
    categorie: "",
    attributos: [],
    description: "",
    normas: "",
    seguridad: "",
    politicas: "",
  });

  const handleChange = (e) => {
    const name = e.target.name;
    const checked = e.target.checked;

    setValues((prevValues) => {
      let newValues = {
        ...prevValues,
        [name]: e.target.value,
      };

      if (checked) {
        newValues.attributos = [...prevValues.attributos, name];
      }
      return newValues;
    });
  };

  useEffect(() => {
    fetch("http://localhost:8080/categories")
      .then((response) => {
        return response.json();
      })
      .then((categories) => {
        setCategories(categories);
      });
  }, []);

  useEffect(() => {
    fetch(`http://localhost:8080/cities`)
      .then((response) => response.json())
      .then((data) => {
        setCities(data);
      })
      .catch(function (error) {
        console.log("Hubo un problema con la petición Fetch:" + error.message);
      });
  }, []);

  useEffect(() => {
    fetch(`http://localhost:8080/attributes`)
      .then((response) => response.json())
      .then((attributes) => {
        setAttributes(attributes);
      });
  }, []);

  const icons = {
    1: <MdOutlineMicrowave />,
    2: <TbDeviceTvOld />,
    3: <BiSun />,
    4: <MdPets />,
    5: <AiFillCar />,
    6: <TbSwimming />,
    7: <AiOutlineWifi />,
    8: <TbBarbell />,
    9: <CgSmartHomeRefrigerator />,
  };

 


  const [miStatus, setMiStatus] = useState();
  const handleSubmit = (e) => {
    e.preventDefault();
    const formData = new FormData()
 
  
    const atributos = [];
    values.attributos.map((value) => atributos.push({"id":value}));
 
    formData.append(
      "post", new Blob ([JSON.stringify ({
        title: values.name,
        description: values.description,
        idCategory: values.categorie,
        idCity: values.city,
        address: values.adress,
        attributes: atributos,
        house_rules: values.normas,
        security: values.seguridad,
        cancellation_policy: values.politicas
      })], {
        type: "application/json"
    })
    );
  

    formData.append("mainImage", selectedImage);
    formData.append("images", selectedImage1);
    formData.append("images", selectedImage2);
  formData.append("images", selectedImage3);
  formData.append("images", selectedImage4);
  
   fetch("http://localhost:8080/products", {
      method: "POST",
      body: formData,
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    }).then((response) => setMiStatus(response.status));
  };
  
  useEffect(() => {
    if (miStatus === 500) {
      setShowModaleInvalid1(true);
    } else if (miStatus === 401) {
      setShowModaleInvalid2(true)
    }else if (miStatus === 415) {
    setShowModaleInvalid1(true)
  }
    else if (miStatus === 200) {
      setShowSuccesModal(true)
    }
  }, [miStatus]);
  

  return (
    <div className="add-property-form">
      <h2>Administración de productos</h2>
      <form onSubmit={handleSubmit}>
        <h4>Crear propiedad</h4>
        <section className="info-property-form">
          <section>
            <label>
              Nombre de la propiedad
              <input
                type="text"
                id="name"
                name="name"
                value={values.name}
                onChange={handleChange}
                required
              />
            </label>
            <label>
              Categorias
              <select
                name="categorie"
                id="categorie"
                value={values.categorie}
                onChange={handleChange}
              >
                <option>Selecione el tipo de alojamiento</option>
                {categories.map((c) => (
                  <option key={c.id} value={c.id}>
                    {c.title}
                  </option>
                ))}
              </select>
            </label>
          </section>

          <section>
            <label>
              Direccion
              <input
                type="text"
                id="adress"
                name="adress"
                placeholder="Escribe tu Nombre"
                value={values.adress}
                onChange={handleChange}
                required
              />
            </label>
            <label>
              Ciudad
              <select
                name="city"
                id="city"
                value={values.city}
                onChange={handleChange}
              >
                <option>Selecione una Ciudad</option>
                {cities.map((city) => (
                  <option key={city.id} value={city.id}>
                    {city.title}
                  </option>
                ))}
              </select>
            </label>
          </section>
          <label>
            Descripcion
            <textarea
              name="description"
              id="description"
              cols="30"
              rows="10"
              value={values.description}
              onChange={handleChange}
            ></textarea>
          </label>
        </section>
        <section className="atributtes-form">
          <h3>Agregar atributos</h3>
          <section>
            {attributes.map((attribute) => (
              <label key={attribute.id}>
                <input
                  type="checkbox"
                  name={attribute.id}
                  checked={values[attribute.name]}
                  value={values.attributos}
                  onChange={handleChange}
                />
                {attribute.title}
                {icons[attribute.id]}
              </label>
            ))}
          </section>
        </section>
        <section className="segurity-policy-forms">
          <h3>Politicas de la propiedad</h3>
          <div>
            <section>
              <h4>Normas de la casa</h4>
              <span>Descripcion</span>
              <textarea
                name="normas"
                id="normas"
                cols="30"
                rows="10"
                value={values.normas}
                onChange={handleChange}
              ></textarea>
            </section>
            <section>
              <h4>Salud y seguridad</h4>
              <span>Descripcion</span>
              <textarea
                name="seguridad"
                id="seguridad"
                cols="30"
                rows="10"
                value={values.seguridad}
                onChange={handleChange}
              ></textarea>
            </section>
            <section>
              <h4>Políticas de cancelación</h4>
              <span>Descripcion</span>
              <textarea
                name="politicas"
                id="politicas"
                cols="30"
                rows="10"
                value={values.politicas}
                onChange={handleChange}
              ></textarea>
            </section>
          </div>
        </section>
        <section className="images-form">
          <h3>Cargar imagenes</h3>
          <div>
            <label className={selectedImage != null && "load"}>
            {selectedImage === null?
              " Subir imagen principal":selectedImage.name}
              <input
                type="file"
                accept="image/*"
                onChange={(event) => setSelectedImage(event.currentTarget.files[0])}
              />
            </label>
          </div>
        </section>
        <section className="complementary-images">
          <h3>Cargar imagenes Complementarias</h3>
          <div>
            <label className={selectedImage1 != null && "load"}>
            {selectedImage1 === null?
              "Subir Imagen 1":selectedImage1.name}

              <input
                type="file"
                accept="image/*"
                onChange={(event) => setSelectedImage1(event.currentTarget.files[0])}
               
              />
            </label>

            <label className={selectedImage2 != null && "load"}>
            {selectedImage2 === null?
              "Subir Imagen 2":selectedImage2.name}

              <input
                type="file"
                accept="image/*"
                onChange={(event) => setSelectedImage2(event.currentTarget.files[0])}
         
              />
            </label>

            <label className={selectedImage3 != null && "load"}>
            {selectedImage3 === null?
              "Subir Imagen 3":selectedImage3.name}

              <input
                type="file"
                accept="image/*"
                onChange={(event) => setSelectedImage3(event.currentTarget.files[0])}
               
              />
            </label>

            <label className={selectedImage4 != null && "load"}>
              {selectedImage4 === null?
              "Subir Imagen 4":selectedImage4.name}

              <input
                type="file"
                accept="image/*"
                onChange={(event) => setSelectedImage4(event.currentTarget.files[0])}
                
              />
            </label>
          </div>
        </section>
        <button type="submit" className="create-product-button">
          crear
        </button>
      </form>
      {
        showModalInvalid &&
        <ModalSuccesReservation 
        onclick={setShowModalInvalid}
          succesMessage={"Debe completar todos los campos"}
          tipebutton2={5}
        />
      }
        {
        showSuccesModal &&
          <ModalSuccesReservation
            succesMessage={"Su producto se ha creado con exito"} 
            thanks
            succes={1}
          />
      }
        {
         showModalInvalid1 &&
        <ModalSuccesReservation 
        onclick={setShowModalInvalid1}
          succesMessage={"El formato o el tamaño de imagen no es valido"}
          tipebutton2={5}
        />
      }
            {
         showModalInvalid2 &&
        <ModalSuccesReservation 
        onclick={setShowModalInvalid2}
          succesMessage={"Debe loguearse para continuar"}
          succes={2}
          tipebutton={4}
        />
      }
    </div>
  );
};

export default NewPropertyForm;
