IMAGE=indieops/ansible

# Ansible 2.6
ANSIBLE_2_6_PPA=ppa:ansible/ansible-2.6
ANSIBLE_2_6_VERSION=2.6.3-1ppa~bionic
IMAGE_2_6_TAG=2.6.3_v1

# Ansible 2.5
ANSIBLE_2_5_PPA=ppa:ansible/ansible-2.5
ANSIBLE_2_5_VERSION=2.5.8-1ppa~bionic
IMAGE_2_5_TAG=2.5.8_v1

# Ansible 2.4
ANSIBLE_2_4_PPA=ppa:ansible/ansible-2.4
ANSIBLE_2_4_VERSION=2.4.6.0-1ppa~bionic
IMAGE_2_4_TAG=2.4.6.0_v1

image:
	docker build -t ${IMAGE}:${IMAGE_2_6_TAG} \
		--build-arg ansible_version=${ANSIBLE_2_6_VERSION} \
		--build-arg ansible_ppa=${ANSIBLE_2_6_PPA} .
	docker build -t ${IMAGE}:${IMAGE_2_5_TAG} \
		--build-arg ansible_version=${ANSIBLE_2_5_VERSION} \
		--build-arg ansible_ppa=${ANSIBLE_2_5_PPA} .
	docker build -t ${IMAGE}:${IMAGE_2_4_TAG} \
		--build-arg ansible_version=${ANSIBLE_2_4_VERSION} \
		--build-arg ansible_ppa=${ANSIBLE_2_4_PPA} .

push: image
	docker push ${IMAGE}:${IMAGE_2_6_TAG}
	docker push ${IMAGE}:${IMAGE_2_5_TAG}
	docker push ${IMAGE}:${IMAGE_2_4_TAG}
