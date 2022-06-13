import axios from "axios";

const show = () => axios.get("/preferences");

const mail = ({ payload }) => axios.patch(`/preferences/mail`, payload);

const update = ({ payload }) => axios.put("/preferences", payload);

const preferencesApi = {
  show,
  update,
  mail,
};

export default preferencesApi;
