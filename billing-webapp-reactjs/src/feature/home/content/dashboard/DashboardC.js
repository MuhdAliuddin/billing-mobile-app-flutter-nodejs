import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'

import { Loading } from '../../../../components/drawable/loading'
import DashboardV from './DashboardV'

import { getDashboard } from '../../../../modules/repositories/home/dashboard/actions'
import { DASHBOARD_STATE } from '../../../../modules/repositories/home/dashboard/creator'

const DashboardC = (props) => {
  const { getDashboard, dataStatus, dataLoad } = props

  useEffect(() => {
    if (dataStatus === DASHBOARD_STATE.PENDING) {
      getDashboard()
    }
  }, [dataStatus, getDashboard])

  if (dataStatus === DASHBOARD_STATE.SUCCESS) {
    return (
      <DashboardV
        state={{
          dashboardData: dataLoad.dashboardData,
        }}
      // callback={{}}
      />
    );
  }
  return <Loading />
};

const actionToPropMap = (dispatch) => {
  return bindActionCreators(
    {
      getDashboard,
    },
    dispatch,
  )
}

const stateToPropMap = (state) => ({
  dataLoad: state.dashboardData.payload,
  dataStatus: state.dashboardData.status,
  error: state.dashboardData.message,
})

DashboardC.propTypes = {
  dataStatus: PropTypes.string,
  dataLoad: PropTypes.object,
  getDashboard: PropTypes.func,
}

export default connect(stateToPropMap, actionToPropMap)(DashboardC)

