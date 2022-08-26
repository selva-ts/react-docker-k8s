/* eslint-disable no-underscore-dangle */
/* eslint-disable import/prefer-default-export */
import defaultVars from './defaultVars.json';

export class EnvVariables {
static instance;

backendApiUrl;

uiVersion;

static getInstance() {
	EnvVariables.instance = new EnvVariables();
	this.setupVariables();

	return EnvVariables.instance;
}

static setupVariables() {
	let windowEnv = window._env_;

	if (!windowEnv) {
		windowEnv = defaultVars;
	}

	EnvVariables.instance.backendApiUrl = windowEnv.BACKEND_API_URL;
	EnvVariables.instance.uiVersion = windowEnv.UI_VERSION;
}

static getBackendApiUrl() {
	return EnvVariables.getInstance().backendApiUrl;
}

static getVersion() {
	return EnvVariables.getInstance().version;
}
}
