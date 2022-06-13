import React from "react";

import classnames from "classnames";

import Button from "components/Button";
import Input from "components/Input";
// import Select from "react-select";

// const defaultTimezone = "UTC";

const PreferenceForm = ({
  notificationDeliveryHour,
  setNotificationDeliveryHour,
  receiveEmail,
  setReceiveEmail,
  loading,
  updatePreference,
  updateEmailNotification,
}) => {
  const onHandleDeliveryHourChange = event => {
    const regex = /^[0-9\b]*$/;
    const deliveryHour = event.target.value;
    if (!regex.test(deliveryHour)) return null;

    return setNotificationDeliveryHour(deliveryHour);
  };

  const handleSubmit = event => {
    event.preventDefault();
    if (receiveEmail) {
      updatePreference();
    }
  };

  const handleEmailNotificationChange = e => {
    setReceiveEmail(e.target.checked);
    return updateEmailNotification(e.target.checked);
  };

  return (
    <form className="mx-auto max-w-lg" onSubmit={handleSubmit}>
      <div className="mt-10 mb-2 flex justify-between text-bb-gray-600">
        <h1 className="mt-5 pb-3 text-2xl font-bold leading-5">
          Pending Tasks in Email
        </h1>
      </div>

      <div
        className={classnames("flex  items-baseline space-x-1", {
          "text-bb-gray-700": receiveEmail,
          "text-bb-gray-600": !receiveEmail,
        })}
      >
        <input
          type="checkbox"
          checked={receiveEmail}
          id="receiveEmail"
          onChange={handleEmailNotificationChange}
        />
        <span>
          Send me a daily email of the pending tasks assigned to me.
          <br /> No email will be sent if there are no pending tasks.
        </span>
      </div>

      <div
        className={classnames("flex items-center space-x-4", {
          "text-bb-gray-700": receiveEmail,
          "text-bb-gray-600": !receiveEmail,
        })}
      >
        <p className="mt-6 text-sm font-medium leading-5 ">
          Delivery Time (Hours)
        </p>
        <Input
          type="number"
          placeholder="Enter hour"
          disabled={!receiveEmail}
          min={0}
          max={23}
          value={notificationDeliveryHour}
          onChange={onHandleDeliveryHourChange}
        />
        <p className="mt-6 font-extrabold">(UTC)</p>
      </div>

      <div className="w-2/6">
        <Button
          type="submit"
          buttonText="Schedule Email"
          className={classnames({
            "bg-opacity-60 cursor-not-allowed": !receiveEmail,
          })}
          loading={loading}
        />
      </div>
    </form>
  );
};

export default PreferenceForm;
